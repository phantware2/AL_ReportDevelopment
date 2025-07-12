report 50100 DateReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    // DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(DataItemName; Date)
        {

            DataItemTableView = where("Period Name" = const('2025-01-01..2025-01-31'));
            column(Period_Name; "Period Name")
            {

            }

            trigger OnPreDataItem()
            begin
                Message('We are on the OnPreDataItem trigger');
            end;

            trigger OnAfterGetRecord()
            begin
                Message('We are on the OnAfterGetRecord trigger');
            end;

            trigger OnPostDataItem()
            begin
                Message('We are on the OnPostDataItem trigger');
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Integer; myInt)
                    {

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }

        trigger OnOpenPage()
        var
            myInt: Integer;
        begin
            Message('Request page is opening... (OnOpenPage)');
        end;
    }

    trigger OnInitReport()
    begin
        // Initialize variables or perform actions before the report runs
        Message('Report is initializing...(OnInitReport)');
        myInt := 10; // Example initialization
    end;

    trigger OnPreReport()
    begin
        Message('Report is about to start processing... (OnPreReport)');
    end;

    trigger OnPostReport()
    begin
        Message('Report has finished processing. (OnPostReport)');
    end;

    /*     rendering
        {
            layout(LayoutName)
            {
                Type = Excel;
                LayoutFile = 'mySpreadsheet.xlsx';
            }
        } */

    var
        myInt: Integer;
}