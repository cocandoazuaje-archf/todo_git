export interface Sistemas2tb {
  id: number;                       // PK autoincremental
  name: string;                     // Nombre
  email: string;                    // Email único
  status: string;                   // Estado
  location?: string;                // Ubicación opcional
  created_at?: string;              // Fecha de creación (timestamp)
  updated_at?: string;              // Fecha de actualización (timestamp)
  item?: string;                    // Item opcional
  bateria_watt?: number;            // Batería en watts
  color?: string;                   // Color
  resolucion?: string;              // Resolución
  serial_number?: string;           // Número de serie único
  sistema_operativo?: string;       // Sistema operativo
  descripcion?: string;             // Descripción
}
