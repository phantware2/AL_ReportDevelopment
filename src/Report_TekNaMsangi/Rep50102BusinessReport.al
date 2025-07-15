report 50102 "Business Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = './src/Report_TekNaMsangi/layouts/BusinessReport.docx';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.") { }
            column(CustomerName; Name) { }
            column(CustomerPhoneNo; "Phone No.") { }
            column(CustomerEMail; "E-Mail") { }
        }
    }


    var
        myInt: Integer;
}