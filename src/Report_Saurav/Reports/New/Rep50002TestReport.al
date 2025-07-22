report 50002 TestReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Report_Saurav/layouts/TestReport.rdl';

    dataset
    {

        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const("Order"));
            RequestFilterFields = "Document Type", "No.";
            PrintOnlyIfDetail = true;

            column(DocumentTypeSH; "Document Type") { }
            column(NoSH; "No.") { }
            column(PostingDateSH; "Posting Date") { }
            column(CustomerNoSH; "Sell-to Customer No.") { }

            dataitem(SalesLine; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") order(ascending);

                column(DocumentTypeSL; "Document Type") { }
                column(DocumentNoSL; "Document No.") { }
                column(LineNoSL; "Line No.") { }
                column(NoSL; "No.") { }

                dataitem("Sales Comment Line"; "Sales Comment Line")
                {
                    column(Comment; Comment) { }
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
        myInt: Integer;
}