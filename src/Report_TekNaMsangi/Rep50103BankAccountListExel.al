report 50103 ExcelReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = MyExcelLayout;

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            column(Bank_Account_No_; "Bank Account No.") { }
            column(PostingDate; "Posting Date") { }
            column(Amount__LCY_; "Amount (LCY)") { }
        }
    }

    rendering
    {
        layout(MyExcelLayout)
        {
            Type = Excel;
            LayoutFile = './src/Report_TekNaMsangi/layouts/bankledger.xlsx';
        }
    }

    var
        myInt: Integer;
}