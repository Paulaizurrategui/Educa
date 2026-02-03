page 50102 "CursosList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Cursos;
    Caption = 'Cursos';
    CardPageId = "CursosCard";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Código"; Rec."Código")
                {
                    ApplicationArea = All;
                }
                field("Nombre curso"; Rec."Nombre curso")
                {
                    ApplicationArea = All;
                }
                field("Edificio"; Rec."Edificio")
                {
                    ApplicationArea = All;
                }
                field("Desc. Curso"; Rec."Desc. Curso")
                {
                    ApplicationArea = All;
                }
                field("Num horas"; Rec."Num horas")
                {
                    ApplicationArea = All;
                }
                field("Departamento"; Rec."Departamento")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
