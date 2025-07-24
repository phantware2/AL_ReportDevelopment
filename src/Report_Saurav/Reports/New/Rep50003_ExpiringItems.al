report 50003 "Expiring Items"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Report_Saurav/layouts/ExpiringItems.rdl';

    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            DataItemTableView = sorting("Item No.") order(ascending) where(Open = const(true));
            RequestFilterFields = "Posting Date", "Item No.";

            column(ItemNo; "Item No.") { }
            column(ExpirationDate; "Expiration Date") { }
            column(LocationCode; "Location Code") { }
            column(Quantity; Quantity) { }
            column(RemainingQuantity; "Remaining Quantity") { }
            column(SerialNo; "Serial No.") { }
            column(TillExpirationDate; TillExpirationDate) { }

            trigger OnPreDataItem()
            begin
                if TillExpirationDate <> 0D then
                    ItemLedgerEntry.SetFilter("Expiration Date", '%1..%2', WorkDate(), TillExpirationDate);
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
                group(Filter)
                {
                    field(ExpiringTill; TillExpirationDateFormula)
                    {

                    }
                }
            }
        }
    }

    labels
    {
        ExpiringInLbl = 'Expiring In..';
    }

    trigger OnPreReport()
    var
        EmptyDateFormula: DateFormula;
    begin
        if TillExpirationDateFormula <> EmptyDateFormula then
            TillExpirationDate := CalcDate(TillExpirationDateFormula, WorkDate());
    end;

    var
        TillExpirationDateFormula: DateFormula;
        TillExpirationDate: Date;
}