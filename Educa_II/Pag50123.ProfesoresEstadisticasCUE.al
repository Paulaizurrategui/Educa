page 50123 "ProfesoresEstadisticasCUE"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = Profesores;
    Caption = 'Estadísticas';

    layout
    {
        area(Content)
        {
            field("Nº Ayudantes"; NºAyudantes)
            {
                ApplicationArea = All;
                Caption = 'Nº de Ayudantes';
                DrillDown = true;

                trigger OnDrillDown()
                var
                    Estudiante: Record Estudiantes;
                    EstudiantesList: Page "EstudiantesList";
                begin
                    Estudiante.SetRange("Tutor", Rec."Código");
                    EstudiantesList.SetTableView(Estudiante);
                    EstudiantesList.Run();
                end;
            }
            field("Nº Clases"; NºClases)
            {
                ApplicationArea = All;
                Caption = 'Nº de Clases';
                DrillDown = true;

                trigger OnDrillDown()
                var
                    Clase: Record Clases;
                    ClasesList: Page "ClasesList";
                begin
                    Clase.SetRange("Código profesor", Rec."Código");
                    ClasesList.SetTableView(Clase);
                    ClasesList.Run();
                end;
            }
        }
    }

    var
        NºAyudantes: Integer;
        NºClases: Integer;

    trigger OnAfterGetRecord()
    var
        Estudiante: Record Estudiantes;
        Clase: Record Clases;
    begin
        Estudiante.SetRange("Tutor", Rec."Código");
        NºAyudantes := Estudiante.Count();

        Clase.SetRange("Código profesor", Rec."Código");
        NºClases := Clase.Count();
    end;
}
