page 50103 "ClasesList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Clases;
    Caption = 'Clases';
    CardPageId = "ClasesCard";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Código curso"; Rec."Código curso")
                {
                    ApplicationArea = All;
                }
                field("Nombre curso"; Rec."Nombre curso")
                {
                    ApplicationArea = All;
                }
                field("Sección"; Rec."Sección")
                {
                    ApplicationArea = All;
                }
                field("Día"; Rec."Día")
                {
                    ApplicationArea = All;
                }
                field("Hora"; Rec."Hora")
                {
                    ApplicationArea = All;
                }
                field("Código profesor"; Rec."Código profesor")
                {
                    ApplicationArea = All;
                }
                field("Nombre profesor"; Rec."Nombre profesor")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
