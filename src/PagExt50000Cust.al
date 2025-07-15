pageextension 50000 CustomerExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Processing)
        {
            action("Open Business Report")
            {
                ApplicationArea = All;
                Caption = 'Open Business Report';
                Image = Report;
                ToolTip = 'Generate a Open Business report for the customer list.';
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.Reset();
                    customer.SetRange("No.", Rec."No.");
                    if Customer.FindSet() then
                        Report.Run(Report::"Business Report", false, false, Customer);
                end;
            }
        }
    }

    var
        myInt: Integer;
}