pageextension 50300 CustomerList extends "Customer List"
{
    trigger OnOpenPage()
    begin
        // Add your code here
        report.Run(Report::LABCustomerList);
    end;
}