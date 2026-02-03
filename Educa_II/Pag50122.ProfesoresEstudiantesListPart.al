page 50122 "ProfesoresEstudiantesListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = Estudiantes;
    Caption = 'Estudiantes tutelados';
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Estudiante)
            {
                Caption = 'Estudiante';
                action("Matrículas")
                {
                    ApplicationArea = All;
                    Caption = 'Matrículas';
                    Image = List;
                    RunObject = page "MatriculasList";
                    RunPageLink = "Código estudiante" = field("Código");
                }
                action("Datos")
                {
                    ApplicationArea = All;
                    Caption = 'Datos';
                    Image = Card;
                    
                    trigger OnAction()
                    var
                        EstudianteCard: Page "EstudiantesCard";
                    begin
                        EstudianteCard.SetRecord(Rec);
                        EstudianteCard.Run();
                    end;
                }
            }
        }
    }
}
