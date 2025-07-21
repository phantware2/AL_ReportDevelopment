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
            column(UnitPrice; "Unit Price") { }
            column(UnitPriceToPrint; UnitPriceToPrint)
            {

            }

            trigger OnAfterGetRecord()
            begin
                If Quantity = 0 then
                    UnitPriceToPrint := 0 // Avoid division by zero
                else
                    UnitPriceToPrint := Round("Line Amount" / Quantity, 0.00001);
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
        UnitPriceToPrint: Decimal;
}