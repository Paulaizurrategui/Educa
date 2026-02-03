table 50104 "Estudiantes"
{
    DataClassification = CustomerContent;
    Caption = 'Estudiantes';

    fields
    {
        field(1; "Código"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código';
        }
        field(2; "Nombre"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Nombre';
        }
        field(3; "Dirección"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Dirección';
        }
        field(4; "Teléfono"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Teléfono';
        }
        field(5; "Tutor"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Tutor';
            TableRelation = Profesores."Código";
        }
        // Campos calculados para lookup
        field(10; "Nombre Tutor"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Profesores.Nombre where("Código" = field(Tutor)));
            Caption = 'Nombre Tutor';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Código")
        {
            Clustered = true;
        }
        key(Tutor; "Tutor")
        {
        }
    }
}
