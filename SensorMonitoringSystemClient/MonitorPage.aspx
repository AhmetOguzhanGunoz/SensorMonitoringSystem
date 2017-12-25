<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MonitorPage.aspx.cs" Inherits="MonitorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="ClientStyle.css" rel="stylesheet" />
    <title>Analyze Sensor Datas over Sensor Monitoring System Site</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

        var SensorReadValueTimes = <%= jsSerializer.Serialize(ChartDateValues)%>;
        var SensorReadValueTimesLength = <%= ChartDateValues.Count%>;

        var DayMonthYear, HoursMinutesSeconds, Day, Month, Year, Hours, Minutes, Seconds, Miliseconds = "0";
        var SplittedWhiteSpace, SplittedDayMonthYear, SplittedHoursMinutesSeconds;

        var DateArray = new Array();     

        for(var i = 0; i < SensorReadValueTimesLength; i++)
        {
            SplittedWhiteSpace = SensorReadValueTimes[i].split(" ");

            DayMonthYear = SplittedWhiteSpace[0];
            HoursMinutesSeconds = SplittedWhiteSpace[1];

            SplittedDayMonthYear = DayMonthYear.split(".");
            Day = SplittedDayMonthYear[0];
            Month = SplittedDayMonthYear[1];
            Year = SplittedDayMonthYear[2];

            SplittedHoursMinutesSeconds = HoursMinutesSeconds.split(":");
            Hours = SplittedHoursMinutesSeconds[0];
            Minutes = SplittedHoursMinutesSeconds[1];
            Seconds = SplittedHoursMinutesSeconds[2];

            //Javascript date month indexes starts from 0. So 1 substracted from month to show exact date
            DateArray.push([new Date(parseInt(Year), parseInt(Month - 1), parseInt(Day), parseInt(Hours), parseInt(Minutes), parseInt(Seconds), parseInt(Miliseconds))]);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
            <div id="banner">
                <div id="bannerpart1">
                    <img src="logo.png" alt="techexpertlogo"/>
                </div>
                <div id="bannerpart2">
                    <h3>Sensor Monitoring System</h3>
                    <p>depends to trustworthy sensor datas</p>
                </div>
            </div>

            <div id="content">
                <div id="Showarea">

                    <div id="chart_div"></div>

                    <asp:Table Width="70%" CellPadding="0" CellSpacing="20" ID="InputTable" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="10%"><asp:Label ID="StartDatelbl" Width="100%" runat="server" Text="StartDate: "></asp:Label></asp:TableCell>
                            <asp:TableCell Width="40%"><asp:TextBox ID="StartDatetxt" TextMode="Date" CssClass="inputclass" Width="100%" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell Width="10%"><asp:Label ID="EndDatelbl" Width="100%" runat="server" Text="EndDate:"></asp:Label></asp:TableCell>
                            <asp:TableCell Width="40%"><asp:TextBox ID="EndDatetxt" TextMode="Date" CssClass="inputclass" Width="100%" runat="server"></asp:TextBox></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <asp:Label ID="Checklbl" Width="100%" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Showbtn" Width="20%" CssClass="buttonclass" runat="server" Text="Demonstrate" OnClick="Showbtn_Click" />

                </div>
            </div>
            <div id="footer">
                <p>TechExpert Information Technologies and Automation Engineering Trade Limited Company <br/> 
                    This site was made by Ahmet Oğuzhan Günöz - Copyright © 2017 - All Rights Reserved</p>
            </div>

        <script type="text/javascript">
            
            google.charts.load("current", { packages: ["corechart"] });
            google.charts.setOnLoadCallback(drawChart);

            var SensorName = <%= jsSerializer.Serialize(ObtainedSensor.SensorDescription)%>;

            var SensorReadValues = <%= jsSerializer.Serialize(ChartDecimalValues)%>;
            var SensorReadValuesLength = <%= ChartDecimalValues.Count%>;

            var SensorUnit = <%= jsSerializer.Serialize(ObtainedSensor.SensorUnit)%>;
            var SensorTimeline = 'Timeline (Hours)';
            var SensorLowestCritical = 'Lowest Critical Value';
            var SensorHighestCritical = 'Highest Critical Value';
            var LowestCriticalValue = <%= jsSerializer.Serialize(ObtainedSensor.LowestCriticalValue)%>;
            var HighestCriticalValue = <%= jsSerializer.Serialize(ObtainedSensor.HighestCriticalValue)%>;
            var GraphicalMinValue = <%= jsSerializer.Serialize(ObtainedSensor.GraphicalMinValue)%>;
            var GraphicalMaxValue = <%= jsSerializer.Serialize(ObtainedSensor.GraphicalMaxValue)%>;

            var Combined = new Array();
            Combined[0] = [SensorTimeline, SensorUnit, SensorLowestCritical, SensorHighestCritical];

            for(var i = 0; i < DateArray.length ; i++)
            {
                Combined[i + 1] = [new Date(DateArray[i]), SensorReadValues[i], LowestCriticalValue, HighestCriticalValue ];
            }

            
            function drawChart() 
            {
                var data = google.visualization.arrayToDataTable(Combined, false);
                
                var options = {
                    title: SensorName,
                    hAxis: { title: SensorTimeline },
                    vAxis: {
                        title: SensorUnit,
                        viewWindow: {
                            max:GraphicalMaxValue,
                            min:GraphicalMinValue
                        }
                    },
                    seriesType: 'line',
                    series: {
                        1: { lineDashStyle: [6, 6] },
                        2: { lineDashStyle: [6, 6] },
                    },
                    colors:['black','blue','red']                    
                };

                var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

        chart.draw(data, options);
      }

        </script>
    </form>
</body>
</html>
