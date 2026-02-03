page 50115 "MatriculasCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Matriculas;
    Caption = 'Ficha matrícula';

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
                }
                field("Código curso"; Rec."Código curso")
                {
                    ApplicationArea = All;
                    
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
                    
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Clase: Record Clases;
                    begin
                        Clase.SetRange("Código curso", Rec."Código curso");
                        if Page.RunModal(Page::"ClasesList", Clase) = Action::LookupOK then begin
                            Rec.Validate("Sección", Clase."Sección");
                            Rec.Validate("Código curso", Clase."Código curso");
                        end;
                    end;
                }
                field("Día"; Rec."Día")
                {
                    ApplicationArea = All;
                }
                field("Hora"; Rec."Hora")
                {
                    ApplicationArea = All;
                }
                field("Código estudiante"; Rec."Código estudiante")
                {
                    ApplicationArea = All;
                    
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Estudiante: Record Estudiantes;
                    begin
                        if Page.RunModal(Page::"EstudiantesList", Estudiante) = Action::LookupOK then begin
                            Rec.Validate("Código estudiante", Estudiante."Código");
                        end;
                    end;
                }
                field("Nombre estudiante"; Rec."Nombre estudiante")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
