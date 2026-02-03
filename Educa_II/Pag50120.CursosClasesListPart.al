page 50120 "CursosClasesListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = Clases;
    Caption = 'Clases del Curso';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
