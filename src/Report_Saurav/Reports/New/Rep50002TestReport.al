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
            RequestFilterFields = "Document Type", "No.";
            PrintOnlyIfDetail = true;

            column(DocumentTypeSH; "Document Type") { }
            column(NoSH; "No.") { }

            dataitem(SalesLine; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                column(DocumentTypeSL; "Document Type") { }
                column(DocumentNoSL; "Document No.") { }
                column(LineNoSL; "Line No.") { }
                column(NoSL; "No.") { }
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