page 50111 "ProfesoresCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Profesores;
    Caption = 'Ficha profesor';

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
            group(Laboral)
            {
                Caption = 'Laboral';
                ShowAsTree = false;

                field("Fecha contratación"; Rec."Fecha contratación")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Departamento"; Rec."Departamento")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Departamento: Record Departamentos;
                    begin
                        if Page.RunModal(Page::"DepartamentosList", Departamento) = Action::LookupOK then begin
                            Rec.Validate("Departamento", Departamento."Código");
                        end;
                    end;

                    trigger OnDrillDown()
                    var
                        Departamento: Record Departamentos;
                        DepartamentoCard: Page "DepartamentosCard";
                    begin
                        if Departamento.Get(Rec."Departamento") then begin
                            DepartamentoCard.SetRecord(Departamento);
                            DepartamentoCard.Run();
                        end;
                    end;
                }
                field("Edificio Departamento"; Rec."Edificio Departamento")
                {
                    ApplicationArea = All;
                }
                field("Delegado Departamento"; Rec."Delegado Departamento")
                {
                    ApplicationArea = All;
                }
            }
            part(Estudiantes; "ProfesoresEstudiantesListPart")
            {
                ApplicationArea = All;
                Caption = 'Estudiantes tutelados';
                SubPageLink = "Tutor" = field("Código");
            }
        }
        area(FactBoxes)
        {
            part(Estadísticas; "ProfesoresEstadisticasCUE")
            {
                ApplicationArea = All;
                Caption = 'Estadísticas';
                SubPageLink = "Código" = field("Código");
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Nueva tutoría")
            {
                ApplicationArea = All;
                Caption = 'Nueva tutoría';
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Estudiante: Record Estudiantes;
                    EstudianteCard: Page "EstudiantesCard";
                begin
                    Estudiante.Init();
                    Estudiante."Tutor" := Rec."Código";
                    Estudiante.Insert(true);
                    Commit();
                    EstudianteCard.SetRecord(Estudiante);
                    EstudianteCard.Run();
                end;
            }
        }
    }
}
