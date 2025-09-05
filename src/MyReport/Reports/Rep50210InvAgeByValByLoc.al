report 50210 "Inventory Age by Value by Loca"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/MyReport/layouts/MyIntransitReport.rdl';
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
                Message('In OnPreDataItem trigger of %1', InventoryAgeBuffer.TableCaption);
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
        myInt: Integer;
}