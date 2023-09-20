const pool = require('../config');

const getAllUser = async () => {
  const query = 'SELECT * FROM Usuarios';

  try {
    const { rows } = await pool.query(query);
    return rows; 
  } catch (error) { throw error }
};


const createUser = async (nombre, tipoUsuario, correoElectronico, contraseña) => {
  const query = `INSERT INTO Usuarios (Nombre, TipoUsuario, CorreoElectronico, Contraseña, Estado)
    VALUES ($1, $2, $3, $4, 'Activo')`;

  const values = [nombre, tipoUsuario, correoElectronico, contraseña];

  try {
    const { rows } = await pool.query(query, values);
    return rows;
  } catch (error) { throw error; }
};


const getUserById = async (userId) => {
  const query = 'SELECT * FROM Usuarios WHERE id = $1';
  const values = [userId];

  try {
    const { rows } = await pool.query(query, values);
    return rows[0];
  } catch (error) { throw error }
};


const updateUser = async (userId, nombre, tipoUsuario, correoElectronico, contraseña) => {
  const query = `UPDATE Usuarios SET Nombre = $2, TipoUsuario = $3, CorreoElectronico = $4, 
  Contraseña = $5 WHERE ID = $1`;

  const values = [userId, nombre, tipoUsuario, correoElectronico, contraseña];

  try {
    const { rowCount } = await pool.query(query, values);
    return 'Usuario actualizado exitosamente';
  } catch (error) { throw error }
};


const deleteUser = async (userId) => {
  const query = `UPDATE Usuarios SET estado = $2 WHERE id = $1`;

  const values = [userId, 'Inactivo'];

  try {
    const { rowCount } = await pool.query(query, values);
    return 'Usuario Eliminado';
  } catch (error) { throw error }
};

module.exports = { getAllUser, createUser, getUserById, updateUser, deleteUser };

