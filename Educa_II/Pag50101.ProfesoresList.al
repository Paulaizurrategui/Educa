page 50101 "ProfesoresList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Profesores;
    Caption = 'Profesores';
    CardPageId = "ProfesoresCard";
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
                field("Nombre"; Rec."Nombre")
                {
                    ApplicationArea = All;
                }
                field("Fecha contratación"; Rec."Fecha contratación")
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
