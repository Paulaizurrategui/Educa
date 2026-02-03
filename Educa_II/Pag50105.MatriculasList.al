page 50105 "MatriculasList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Matriculas;
    Caption = 'Matriculaciones';
    CardPageId = "MatriculasCard";
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
                field("Código estudiante"; Rec."Código estudiante")
                {
                    ApplicationArea = All;
                }
                field("Nombre estudiante"; Rec."Nombre estudiante")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Información)
            {
                Caption = 'Información';
                action("Curso")
                {
                    ApplicationArea = All;
                    Caption = 'Curso';
                    Image = Document;
                    RunObject = page "CursosCard";
                    RunPageLink = "Código" = field("Código curso");
                }
                action("Clase")
                {
                    ApplicationArea = All;
                    Caption = 'Clase';
                    Image = Document;
                    RunObject = page "ClasesCard";
                    RunPageLink = "Código curso" = field("Código curso"), "Sección" = field("Sección");
                }
            }
            group(Estudiante)
            {
                Caption = 'Estudiante';
                action("Estudiante_Action")
                {
                    ApplicationArea = All;
                    Caption = 'Estudiante';
                    Image = Contact;
                    RunObject = page "EstudiantesCard";
                    RunPageLink = "Código" = field("Código estudiante");
                }
                action("Matrículas")
                {
                    ApplicationArea = All;
                    Caption = 'Matrículas';
                    Image = List;
                    RunObject = page "MatriculasList";
                    RunPageLink = "Código estudiante" = field("Código estudiante");
                }
                action("Tutor")
                {
                    ApplicationArea = All;
                    Caption = 'Tutor';
                    Image = Employee;

                    trigger OnAction()
                    var
                        Estudiante: Record Estudiantes;
                        ProfesorCard: Page "ProfesoresCard";
                    begin
                        if Estudiante.Get(Rec."Código estudiante") then begin
                            ProfesorCard.SetRecord(Estudiante."Tutor");
                            ProfesorCard.Run();
                        end;
                    end;
                }
            }
        }
    }
}
