report 50210 "Inventory Age by Value by Loca"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/MyReport/layouts/InventoryAgeByValueByLoca.rdl';
    Caption = 'Inventory Age by Value by Location';

    dataset
    {
        dataitem(InventoryAgeBuffer; "Inventory Age Buffer")
        {
            RequestFilterFields = "Item No.", "Location Code", "Item Category";
            column(ItemNo; "Item No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(LocationCode; "Location Code")
            {
                IncludeCaption = true;
            }
            column(ItemCategory; "Item Category")
            {
                IncludeCaption = true;
            }
            column(Qty0_30; "Qty 0-30")
            {
                IncludeCaption = true;
            }
            column(Qty31_60; "Qty 31-60")
            {
                IncludeCaption = true;
            }
            column(Qty61_90; "Qty 61-90")
            {
                IncludeCaption = true;
            }
            column(Qty91_120; "Qty 91-120")
            {
                IncludeCaption = true;
            }
            column(Qty121_150; "Qty 121-150")
            {
                IncludeCaption = true;
            }
            column(Qty151_180; "Qty 151-180")
            {
                IncludeCaption = true;
            }
            column(Qty181Above; "Qty 181+")
            {
                IncludeCaption = true;
            }
            column(Val0_30; "Val 0-30")
            {
                IncludeCaption = true;
            }
            column(Val31_60; "Val 31-60")
            {
                IncludeCaption = true;
            }
            column(Val61_90; "Val 61-90")
            {
                IncludeCaption = true;
            }
            column(Val91_120; "val 91-120")
            {
                IncludeCaption = true;
            }
            column(Val121_150; "val 121-150")
            {
                IncludeCaption = true;
            }
            column(Val151_180; "val 151-180")
            {
                IncludeCaption = true;
            }
            column(Val181Above; "val 181+")
            {
                IncludeCaption = true;
            }
            column(TotalQty; "Total Qty")
            {
                IncludeCaption = true;
            }
            column(TotalValue; "Total Value")
            {
                IncludeCaption = true;
            }

            trigger OnPreDataItem()
            begin
                InventoryAgeBuffer.DeleteAll();
                GenerateInventoryAging();
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
                group(Group)
                {
                    field(LocationFilter; LocationFilter)
                    {
                        Caption = 'Location Filter';
                        ToolTip = 'Enter a filter for Location Code.';
                    }
                }
            }
        }
        var
            LocationFilter: Integer;
    }

    var
        TempBuffer: Record "Inventory Age Buffer";
        LocationFilter: Code[10];

    procedure GenerateInventoryAging()
    var
        ILE: Record "Item Ledger Entry";
        Item: Record Item;
        TodayDate: Date;
        ItemAge: Integer;
        CostPerUnit: Decimal;
    begin
        TodayDate := Today();

        ILE.SetFilter("Remaining Quantity", '<> 0');
        if LocationFilter <> '' then
            ILE.SetFilter("Location Code", LocationFilter);
        if ILE.FindSet() then
            ILE.CalcFields("Cost Amount (Actual)", "Cost Amount (Expected)");
        repeat
            ItemAge := TodayDate - ILE."Posting Date";

            TempBuffer.Reset();
            TempBuffer.SetRange("Item No.", ILE."Item No.");
            TempBuffer.SetRange("Location Code", ILE."Location Code");
            if not TempBuffer.FindFirst() then begin
                Item.Get(ILE."Item No.");
                TempBuffer.Init();
                TempBuffer."Item No." := ILE."Item No.";
                TempBuffer."Item Category" := Item."Item Category Code";
                TempBuffer."Inventory Posting Group" := Item."Inventory Posting Group";
                TempBuffer."Location Code" := ILE."Location Code";
                if Item.Get(ILE."Item No.") then
                    TempBuffer.Description := Item.Description;
                TempBuffer.Insert();
            end;
            ILE.CalcFields("Cost Amount (Actual)", "Cost Amount (Expected)");

            if ILE.Quantity <> 0 then
                CostPerUnit := (ILE."Cost Amount (Actual)" + ILE."Cost Amount (Expected)" / ILE.Quantity)
            else
                CostPerUnit := 0;

            CASE TRUE of
                ItemAge <= 30:
                    begin
                        TempBuffer."Qty 0-30" += ILE."Remaining Quantity";
                        TempBuffer."Val 0-30" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
            END;
            TempBuffer."Total Qty" += ILE."Remaining Quantity";
            TempBuffer."Total Value" += ILE."Remaining Quantity" * CostPerUnit;
            TempBuffer.Modify();
        until ILE.Next() = 0;
    end;
}