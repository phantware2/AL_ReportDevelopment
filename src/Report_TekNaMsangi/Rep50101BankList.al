report 50101 "Bank Account List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Report_TekNaMsangi/layouts/BankAccountList.rdl';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Date Filter";

            column(BankNo; "No.") { }
            column(BankName; "Name") { }
            column(BankBranchNo; "Bank Branch No.") { }
            column(BankBalance; "Balance (LCY)") { }
            column(CompanyName; compInfo.Name) { }
            column(CompanyPic; compInfo.Picture) { }
            column(BankReportTitle; BankReportTitle) { }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No.");
                // DataItemTableView = sorting("Posting Date");

                column(Document_No_; "Document No.") { }
                column(Description; Description) { }
                column(PostingDate; "Posting Date") { }
                column(Amount; Amount) { }
                // column(CurrencyCode; "Currency Code") { }
                // column(EntryNo; "Entry No.") { }
            }
        }
    }

    trigger OnPreReport()
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);
    end;


    var
        CompInfo: Record "Company Information";
        BankReportTitle: Label 'Bank Account List';
}