page 50104 "EstudiantesList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Estudiantes;
    Caption = 'Estudiantes';
    CardPageId = "EstudiantesCard";
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
                field("Dirección"; Rec."Dirección")
                {
                    ApplicationArea = All;
                }
                field("Teléfono"; Rec."Teléfono")
                {
                    ApplicationArea = All;
                }
                field("Tutor"; Rec."Tutor")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
