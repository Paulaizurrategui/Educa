page 50121 "ClasesEstadisticasCUE"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = Clases;
    Caption = 'Estadísticas';

    layout
    {
        area(Content)
        {
            field("Nº Matrículas"; Rec."Nº Matrículas")
            {
                ApplicationArea = All;
                Caption = 'Nº de Matrículas';
                DrillDown = true;

                trigger OnDrillDown()
                var
                    Matricula: Record Matriculas;
                    MatriculasList: Page "MatriculasList";
                begin
                    Matricula.SetRange("Código curso", Rec."Código curso");
                    Matricula.SetRange("Sección", Rec."Sección");
                    MatriculasList.SetTableView(Matricula);
                    MatriculasList.Run();
                end;
            }
        }
    }
}
