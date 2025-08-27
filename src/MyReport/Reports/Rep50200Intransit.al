report 50200 MyIntransitReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Excel;
    ExcelLayout = './src/MyReport/layouts/MyIntransitReport.xlsx';

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            // DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(TransferNo; "No.")
            {
                IncludeCaption = true;
            }
            column(Transfer_from_Code; "Transfer-from Code")
            {
                IncludeCaption = true;
            }
            column(Transfer_to_Code; "Transfer-to Code")
            {
                IncludeCaption = true;
            }
            column(Posting_Date; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(NoofDays; NoofDays)
            {
            }
            dataitem("Transfer Line"; "Transfer Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = SORTING("Line No.");
                column(ItemNo; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Description; Description)
                {
                    IncludeCaption = true;
                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
            }
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
                    // field(Name; SourceExpression)
                    // {

                    // }
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
    }
    var
        NoofDays: Integer;
}