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
            column(Today; Today) { }
            column(PostingDate; PostingDate) { }
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
            column(Qty180_210; "val 181-210")
            {
                IncludeCaption = true;
            }
            column(Qty210_240; "Qty 210-240")
            {
                IncludeCaption = true;
            }
            column(Qty240_270; "Qty 240-270")
            {
                IncludeCaption = true;
            }
            column(Qty270_300; "Qty 270-300")
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
            column(Val181_210; "val 181-210")
            {
                IncludeCaption = true;
            }
            column(Val210_240; "val 210-240")
            {
                IncludeCaption = true;
            }
            column(Val240_270; "val 240-270")
            {
                IncludeCaption = true;
            }
            column(Val270_300; "val 270-300")
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
                TempBuffer.PostingDate := ILE."Posting Date";
                TempBuffer.Today := TodayDate;
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
                ItemAge <= 60:
                    begin
                        TempBuffer."Qty 31-60" += ILE."Remaining Quantity";
                        TempBuffer."Val 31-60" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 90:
                    begin
                        TempBuffer."Qty 61-90" += ILE."Remaining Quantity";
                        TempBuffer."Val 61-90" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 120:
                    begin
                        TempBuffer."Qty 91-120" += ILE."Remaining Quantity";
                        TempBuffer."val 91-120" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 150:
                    begin
                        TempBuffer."Qty 121-150" += ILE."Remaining Quantity";
                        TempBuffer."val 121-150" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 180:
                    begin
                        TempBuffer."Qty 151-180" += ILE."Remaining Quantity";
                        TempBuffer."val 151-180" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 210:
                    begin
                        TempBuffer."Qty 181-210" += ILE."Remaining Quantity";
                        TempBuffer."val 181-210" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 240:
                    begin
                        TempBuffer."Qty 210-240" += ILE."Remaining Quantity";
                        TempBuffer."val 210-240" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 270:
                    begin
                        TempBuffer."Qty 240-270" += ILE."Remaining Quantity";
                        TempBuffer."val 240-270" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                ItemAge <= 300:
                    begin
                        TempBuffer."Qty 270-300" += ILE."Remaining Quantity";
                        TempBuffer."val 270-300" += ILE."Remaining Quantity" * CostPerUnit;
                    end;
                else begin
                    TempBuffer."Qty 300+" += ILE."Remaining Quantity";
                    TempBuffer."val 300+" += ILE."Remaining Quantity" * CostPerUnit;
                end;
            END;
            TempBuffer."Total Qty" += ILE."Remaining Quantity";
            TempBuffer."Total Value" += ILE."Remaining Quantity" * CostPerUnit;
            TempBuffer.Modify();
        until ILE.Next() = 0;
    end;
}