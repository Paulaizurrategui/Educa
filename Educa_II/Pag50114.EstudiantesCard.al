page 50114 "EstudiantesCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Estudiantes;
    Caption = 'Ficha estudiante';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                ShowAsTree = false;

                field("Código"; Rec."Código")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Nombre"; Rec."Nombre")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
            }
            group(Comunicación)
            {
                Caption = 'Comunicación';
                ShowAsTree = false;

                field("Dirección"; Rec."Dirección")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Teléfono"; Rec."Teléfono")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
            }
            group(Tutor)
            {
                Caption = 'Tutor';
                ShowAsTree = false;

                field("Tutor_Field"; Rec."Tutor")
                {
                    ApplicationArea = All;
                    Caption = 'Tutor';
                    ShowMandatory = true;
                    
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Profesor: Record Profesores;
                    begin
                        if Page.RunModal(Page::"ProfesoresList", Profesor) = Action::LookupOK then begin
                            Rec.Validate("Tutor", Profesor."Código");
                        end;
                    end;

                    trigger OnDrillDown()
                    var
                        Profesor: Record Profesores;
                        ProfesorCard: Page "ProfesoresCard";
                    begin
                        if Profesor.Get(Rec."Tutor") then begin
                            ProfesorCard.SetRecord(Profesor);
                            ProfesorCard.Run();
                        end;
                    end;
                }
                field("Nombre Tutor"; Rec."Nombre Tutor")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Nueva matrícula")
            {
                ApplicationArea = All;
                Caption = 'Nueva matrícula';
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Matricula: Record Matriculas;
                    MatriculaCard: Page "MatriculasCard";
                begin
                    Matricula.Init();
                    Matricula."Código estudiante" := Rec."Código";
                    Matricula.Insert(true);
                    Commit();
                    MatriculaCard.SetRecord(Matricula);
                    MatriculaCard.Run();
                end;
            }
        }
        area(Navigation)
        {
            action("Matrículas")
            {
                ApplicationArea = All;
                Caption = 'Matrículas';
                Image = List;
                RunObject = page "MatriculasList";
                RunPageLink = "Código estudiante" = field("Código");
            }
        }
    }
}
