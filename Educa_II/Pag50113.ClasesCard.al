page 50113 "ClasesCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Clases;
    Caption = 'Ficha clase';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                ShowAsTree = false;

                field("Código curso"; Rec."Código curso")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Curso: Record Cursos;
                    begin
                        if Page.RunModal(Page::"CursosList", Curso) = Action::LookupOK then begin
                            Rec.Validate("Código curso", Curso."Código");
                        end;
                    end;
                }
                field("Nombre curso"; Rec."Nombre curso")
                {
                    ApplicationArea = All;
                }
                field("Sección"; Rec."Sección")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Día"; Rec."Día")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Hora"; Rec."Hora")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Código profesor"; Rec."Código profesor")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Profesor: Record Profesores;
                    begin
                        if Page.RunModal(Page::"ProfesoresList", Profesor) = Action::LookupOK then begin
                            Rec.Validate("Código profesor", Profesor."Código");
                        end;
                    end;
                }
                field("Nombre profesor"; Rec."Nombre profesor")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(Estadísticas; "ClasesEstadisticasCUE")
            {
                ApplicationArea = All;
                Caption = 'Estadísticas';
                SubPageLink = "Código curso" = field("Código curso"), "Sección" = field("Sección");
            }
        }
    }
}
