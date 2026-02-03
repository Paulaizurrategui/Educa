table 50105 "Matriculas"
{
    DataClassification = CustomerContent;
    Caption = 'Matriculas';

    fields
    {
        field(1; "Código"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código';
        }
        field(2; "Sección"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sección';
        }
        field(3; "Código curso"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código curso';
            TableRelation = Cursos."Código";
        }
        field(4; "Código estudiante"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código estudiante';
            TableRelation = Estudiantes."Código";
        }
        // Campos calculados para lookup
        field(10; "Nombre curso"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Cursos."Nombre curso" where("Código" = field("Código curso")));
            Caption = 'Nombre curso';
            Editable = false;
        }
        field(11; "Nombre estudiante"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Estudiantes.Nombre where("Código" = field("Código estudiante")));
            Caption = 'Nombre estudiante';
            Editable = false;
        }
        field(12; "Día"; Text[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Clases.Día where("Código curso" = field("Código curso"), "Sección" = field(Sección)));
            Caption = 'Día';
            Editable = false;
        }
        field(13; "Hora"; Time)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Clases.Hora where("Código curso" = field("Código curso"), "Sección" = field(Sección)));
            Caption = 'Hora';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Código")
        {
            Clustered = true;
        }
        key(Estudiante; "Código estudiante")
        {
        }
        key(Curso; "Código curso", "Sección")
        {
        }
    }
}
