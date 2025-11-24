report 60000 "WIN_Proforma Invoice UPI"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Proforma Invoice';
    RDLCLayout = 'Src/Rdlc/Rep60000WINProformaInvoice.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            CalcFields = "Amount Including VAT";
            DataItemTableView = sorting("No.") where(Status = filter(Released));
            column(No_; "No.")
            { }
            column(Posting_Date; Format("Posting Date"))
            { }
            column(Currency_Code; "Currency Code")
            { }

            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            column(Sell_to_Contact; "Sell-to Contact")
            { }
            // column(RecCust_Add1; CustAddress){ }
            // column(RecCust_TRN; RecCust."VAT Registration No.")
            // { }
            // column(RecCust_FAX; RecCust."Fax No.")
            // { }
            // column(RecCust_Tel; RecCust."Phone No.")
            // { }
            // column(RecCompInfo_Name; RecCompInfo.Name)
            // { }

            // column(RecCompInfoPice; RecCompInfo.Picture)
            // {
            // }
            // column(PaymentTermsDescription; PaymentTerms.Description)
            // { }
            // column(RecCompInfo_Address; RecCompInfo.Address)
            // { }
            // column(RecCompInfo_Add2; RecCompInfo."Address 2")
            // { }
            // column(RecCompInfo_Phone; RecCompInfo."Phone No.")
            // { }
            // column(RecCompInfo_Fax; RecCompInfo."Fax No.")
            // { }
            // column(RecCompInfo_Email; RecCompInfo."E-Mail")
            // { }
            column(RecCompInfo_HomePage; '')
            { }
            // column(SG_Member_Full_Name; "SG_Member Full Name"){ }
            column(Quote_Accepted_Date; Format("Quote Accepted Date"))
            { }
            // column(RecCompInfo_TRN; RecCompInfo."VAT Registration No.") { }
            // column(RecCompInfo_Picture; RecCompInfo.Picture) { }
            column(Ship_to_Name; "Ship-to Name")
            { }
            column(Ship_to_Address; "Ship-to Address")
            { }
            column(Ship_to_Address_2; "Ship-to Address 2")
            { }
            // column(AmountInWords; AmountInWords) { }
            column(Payment_Method_Code; "Payment Method Code")
            { }
            column(Payment_Terms_Code; "Payment Terms Code")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Your_Reference; "Your Reference")
            { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            { }
            column(Company_Bank_Account_Code; "Company Bank Account Code")
            { }
            column(Order_Date; Format("Order Date"))
            { }
            // column(txtShiptoAddress; txtShiptoAddress) { }
            // column(Responsibility_Center; UserName) { }
            // column(SalespersonPurchaserContactNo; SalespersonPurchaserContactNo) { }
            // column(SalespersonPurchaserEmail; SalespersonPurchaserEmail) { }
            column(Requested_Delivery_Date; Format("Requested Delivery Date"))
            { }
            // column(BankAccountName; BankAccountName) { }
            // column(BankAccountNo; BankAccountNo) { }
            // column(BankAccountName1; BankAccountName1) { }
            // column(BankAccountNo1; BankAccountNo1) { }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");
                column(Document_No_; "Document No.")
                { }
                column(ItemNo_; "No.")
                { }
                column(Description; Description)
                { }
                column(VATBaseAmount; "VAT Base Amount")
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Quantity; Quantity)
                { }
                column(VAT__; "VAT %")
                { }
                column(VAT_Base_Amount; "VAT Base Amount")
                { }
                column(Unit_Price; "Unit Price")
                { }
                column(Amount; "Line Amount")
                { }
                column(Amount_Including_VAT; "Amount Including VAT")
                { }
                // column(SrNo; SrNo) { }
                column(WIN_Proforma_PrePayment_Amount; 0)
                { }
                // column(VatAmt; VatAmt) { }
                // trigger OnAfterGetRecord()
                // begin
                //     SrNo += 1;
                //     LineNumber := LineNumber + 1;
                //     VatAmt := 0;
                //     VatAmt := Amount * ("VAT %" / 100);
                // end;
            }
            dataitem(NoOfLine; Integer)
            {
                DataItemTableView = SORTING(Number)
                          ORDER(Ascending);
                column(Number_EmptyLine; Number)
                { }

                // trigger OnPreDataItem()

                // begin
                //     IF (LineNumber <= 10) THEN
                //         RemainingLines := 10 - LineNumber
                //     ELSE IF (LineNumber > 10) AND (LineNumber <= 25) THEN
                //         RemainingLines := 25 - LineNumber
                //     ELSE IF (LineNumber > 25) THEN
                //         RemainingLines := 55 - LineNumber
                //     ELSE IF (LineNumber > 55) THEN
                //         RemainingLines := 115 - LineNumber
                //     ELSE IF (LineNumber > 115) THEN
                //         RemainingLines := 175 - LineNumber
                //     ELSE IF (LineNumber > 175) THEN
                //         RemainingLines := 235 - LineNumber;

                //     //RemainingLines := 50 - ((LineNumber - 23) MOD 50);
                //     NoOfLine.SETRANGE(Number, 1, RemainingLines);

                //     IF (RemainingLines <= 0) THEN
                //         NoOfLine.SETRANGE(Number, 1, 1);
                // end;

                // trigger OnAfterGetRecord()
                // begin
                //     LineNumber := LineNumber + 1;
                // end;
            }

            // trigger OnAfterGetRecord()
            // begin
            //     CustAddress := '';
            //     if RecCust.get("Sales Header"."Sell-to Customer No.") then;
            //     if CountryRegion.Get(RecCust."Country/Region Code") then;
            //     CustAddress := RecCust.Address + ', ' + RecCust."Address 2" + ', ' + RecCust.City + '-' + RecCust."Post Code" + ', ' + CountryRegion.Name;
            //     if PaymentTerms.Get("Sales Header"."Payment Terms Code") then;

            //     txtShiptoAddress := '';
            //     IF "Sales Header"."Ship-to Code" <> '' THEN BEGIN
            //         ShiptoAddress.Get("Sales Header"."Sell-to Customer No.", "Sales Header"."Ship-to Code");
            //         if CountryRegion.Get(ShiptoAddress."Country/Region Code") then;
            //         txtShiptoAddress := ShiptoAddress.Address + ', ' + ShiptoAddress."Address 2" + ', ' + ShiptoAddress.City + '-' + ShiptoAddress."Post Code" + ', ' + CountryRegion.Name;
            //     end Else begin
            //         if RecCust.get("Sales Header"."Sell-to Customer No.") then;
            //         if CountryRegion.Get(RecCust."Country/Region Code") then;
            //         txtShiptoAddress := RecCust.Address + ', ' + RecCust."Address 2" + ', ' + RecCust.City + '-' + RecCust."Post Code" + ', ' + CountryRegion.Name;
            //     end;

            //     UserName := '';
            //     Users.Reset();
            //     Users.SetRange(Users."User Name", UserId);
            //     IF Users.FindFirst() then
            //         UserName := Users."Full Name";

            //     SalespersonPurchaserContactNo := '';
            //     SalespersonPurchaserEmail := '';
            //     if SalespersonPurchaser.Get("Sales Header"."Salesperson Code") then;
            //     SalespersonPurchaserContactNo := SalespersonPurchaser."Phone No.";
            //     SalespersonPurchaserEmail := SalespersonPurchaser."E-Mail";

            //     if cdBankAccount <> '' then begin
            //         BankAccount.Get(cdBankAccount);
            //         BankAccountName := BankAccount.Name;
            //         BankAccountNo := BankAccount."Bank Account No.";
            //     end else begin
            //         if BankAccount.Get("Company Bank Account Code") then;
            //         BankAccountName := BankAccount.Name;
            //         BankAccountNo := BankAccount."Bank Account No.";
            //     end;

            //     BankAccountName1 := '';
            //     BankAccountNo1 := '';
            //     if cdBankAccount1 <> '' then
            //         if BankAccount.Get(cdBankAccount1) then begin
            //             BankAccountName1 := BankAccount.Name;
            //             BankAccountNo1 := BankAccount."Bank Account No.";
            //         end;

            //     RecCompInfo.get;
            //     RecCompInfo.CalcFields(Picture);
            //     SrNo := 0;
            //     Clear(RepCheck);
            //     RepCheck.InitTextVariable();
            //     RepCheck.FormatNoText(NoText, "Amount Including VAT", "Currency Code");
            //     AmountInWords := NoText[1] + ' ' + NoText[2];
            // end;
        }
    }
    requestpage
    {

        layout
        {
            area(content)
            {
                // field(BankAccount; cdBankAccount)
                // {
                //     TableRelation = "Bank Account";
                //     Caption = 'Bank Account Code 1';
                //     ApplicationArea = All;
                // }
                // field(BankAccount2; cdBankAccount1)
                // {
                //     TableRelation = "Bank Account";
                //     Caption = 'Bank Account Code 2';
                //     ApplicationArea = All;
                // }
            }

        }

        actions
        {
        }
    }

    labels
    {
    }
    var

        RecCust: Record Customer;
        RecCompInfo: Record "Company Information";
        CountryRegion: Record "Country/Region";
        PaymentTerms: Record "Payment Terms";
        ShiptoAddress: Record "Ship-to Address";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        BankAccount: Record "Bank Account";
        Users: Record User;
    // RepCheck: Report Check;
    // BankAccountName: Text;
    // BankAccountNo: Text;
    // cdBankAccount: Text;
    // cdBankAccount1: Text;
    // BankAccountName1: Text;
    // BankAccountNo1: Text;
    // txtShiptoAddress: Text;
    // CustAddress: Text;
    // UserName: Text;
    // SalespersonPurchaserEmail: Text;
    // SalespersonPurchaserContactNo: Text;
    // SrNo: Integer;
    // NoText: array[2] of Text;
    // AmountInWords: Text;
    // LineNumber: Integer;
    // RemainingLines: Integer;
    // VatAmt: Decimal;
}