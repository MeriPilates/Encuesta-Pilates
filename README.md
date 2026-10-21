# Encuesta de Pilates

Encuesta anónima de 1 minuto para después de clase (dolor y motivación al empezar y al terminar, zonas de dolor y comentarios). Las alumnas la abren escaneando un QR y las respuestas se guardan en [Supabase](https://supabase.com).

| Archivo | Qué es |
|---|---|
| `encuesta.html` | La encuesta (pública, la que abre el QR) |
| `resultados.html` | Resultados en tarjetas, con acceso por email y contraseña |
| `qr.html` | Genera e imprime el QR que apunta a la encuesta |
| `config.js` | URL y clave pública de Supabase |
| `supabase/schema.sql` | Tabla y reglas de seguridad |

## Puesta en marcha

1. **Crea un proyecto** gratuito en supabase.com.
2. **Crea la tabla**: *SQL Editor → New query*, pega `supabase/schema.sql` y pulsa *Run*.
3. **Crea tu usuario**: *Authentication → Users → Add user* (email + contraseña, marca *Auto confirm*).
4. **Cierra los registros** para que nadie más pueda crearse una cuenta y ver los resultados:
   *Authentication → Sign In / Providers → desactiva "Allow new users to sign up"*.
5. **Rellena `config.js`** con la *Project URL* y la clave *anon* / *publishable* (*Project Settings → API*).
   Esa clave es pública y se puede subir a GitHub. **Nunca** pongas la `service_role` / `secret`.
6. **Publica en GitHub Pages**: sube la carpeta a un repositorio → *Settings → Pages → Deploy from a branch → main / root*.
7. Abre `https://TU-USUARIO.github.io/TU-REPO/qr.html` e imprime el QR.

## Seguridad

- Cualquiera con el enlace puede **enviar** respuestas, pero no leerlas.
- Solo un usuario con sesión iniciada puede **leer y borrar** respuestas.
- No se guarda ningún dato personal (ni nombre, ni IP, ni email de quien responde).
