using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonitorPage : System.Web.UI.Page
{
    static public Sensors ObtainedSensor = new Sensors();
    static public List<SensorsDatas> ObtainedSensorDatas = new List<SensorsDatas>();
    public List<decimal> ChartDecimalValues = new List<decimal>();
    public List<string> ChartDateValues = new List<string>();
    public JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

    protected void Page_Load(object sender, EventArgs e)
    {
        string SensorID = "";

        if (!IsPostBack)
        {
            if (Session["SensorID"] == null)
            {
                Response.Redirect("ProfilePage.aspx");
            }
            else
            {
                SensorID = Session["SensorID"].ToString();
                Session.RemoveAll();
            }

                string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

                ObtainedSensor = null;
                ObtainedSensorDatas.Clear();

                var ObtainSensorClient = new WebClient();
                var JsonGetSensor = ObtainSensorClient.DownloadString(wsUrl + "/rest/findsensor/" + SensorID);
                var GetSensor = JsonHelper.Deserialize<Sensors>(JsonGetSensor);
                ObtainedSensor = GetSensor;

                var ObtainSensorDatasClient = new WebClient();
                var JsonGetSensorDatas = ObtainSensorDatasClient.DownloadString(wsUrl + "/rest/findallsensordatas/" + SensorID);
                var GetSensorDatas = JsonHelper.Deserialize<List<SensorsDatas>>(JsonGetSensorDatas);

                foreach (SensorsDatas Data in GetSensorDatas)
                {
                    ObtainedSensorDatas.Add(Data);
                    ChartDateValues.Add(Data.ReadValueTime.ToString());
                    ChartDecimalValues.Add(Data.ReadValue);
                }
            
        }
    }

    protected void Showbtn_Click(object sender, EventArgs e)
    {
        if(StartDatetxt.Text == string.Empty || EndDatetxt.Text == string.Empty)
        {
            Checklbl.Text = "Please specify proper date";

            ChartDateValues.Clear();
            ChartDecimalValues.Clear();

            foreach (SensorsDatas Data in ObtainedSensorDatas)
            {
                ChartDateValues.Add(Data.ReadValueTime.ToString());
                ChartDecimalValues.Add(Data.ReadValue);
            }
        }
        else
        {
            DateTime StartDate = DateTime.Parse(StartDatetxt.Text);
            DateTime EndDate = DateTime.Parse(EndDatetxt.Text);
            int result = DateTime.Compare(StartDate, EndDate);

            if (result > 0)
            {
                Checklbl.Text = "Start date must be earlier than end date.";

                ChartDateValues.Clear();
                ChartDecimalValues.Clear();

                foreach (SensorsDatas Data in ObtainedSensorDatas)
                {
                    ChartDateValues.Add(Data.ReadValueTime.ToString());
                    ChartDecimalValues.Add(Data.ReadValue);
                }
            }
            else if (result == 0)
            {
                Checklbl.Text = "End date must be later than start date.";

                ChartDateValues.Clear();
                ChartDecimalValues.Clear();

                foreach (SensorsDatas Data in ObtainedSensorDatas)
                {
                    ChartDateValues.Add(Data.ReadValueTime.ToString());
                    ChartDecimalValues.Add(Data.ReadValue);
                }
            }
            else
            {
                bool found = false;
                int Startindex = 0;
                int Endindex = 0;

                for (int i = 0; i < ObtainedSensorDatas.Count; i++)
                {
                    if(DateTime.Compare(ObtainedSensorDatas[i].ReadValueTime,StartDate) == 0)
                    {
                        found = true;
                        Startindex = i;
                    }
                    
                    if( (DateTime.Compare(ObtainedSensorDatas[i].ReadValueTime, EndDate) == 0) || (Endindex == 0 && i == ObtainedSensorDatas.Count - 1)  )
                    {
                        Endindex = i + 1;
                    }
                }

                if(!found)
                {
                    Checklbl.Text = "There is no sensor datas in specified date.";
                    ChartDateValues.Clear();
                    ChartDecimalValues.Clear();

                    foreach (SensorsDatas Data in ObtainedSensorDatas)
                    {
                        ChartDateValues.Add(Data.ReadValueTime.ToString());
                        ChartDecimalValues.Add(Data.ReadValue);
                    }
                }
                else
                {
                    Checklbl.Text = "Datas are demonstrated in figure.";
                    ChartDateValues.Clear();
                    ChartDecimalValues.Clear();

                    for (int counter = Startindex; counter < Endindex; counter++)
                    {
                        ChartDateValues.Add(ObtainedSensorDatas[counter].ReadValueTime.ToString());
                        ChartDecimalValues.Add(ObtainedSensorDatas[counter].ReadValue);
                    }
                }
            }
        }
    }
}