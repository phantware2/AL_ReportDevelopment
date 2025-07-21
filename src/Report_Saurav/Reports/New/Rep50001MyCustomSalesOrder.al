report 50001 "My Custom Sales Order"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Report_Saurav/layouts/MyCustomSalesOrder.rdl';

    dataset
    {
        dataitem("Sales Line"; "Sales Line")
        {
            column(Type; Type) { }
            column(No; "No.") { }
            column(Description; Description) { }
            column(UnitofMeasure; "Unit of Measure") { }
            column(Quantity; Quantity) { }
            column(Line_Amount; "Line Amount") { }
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