const userModel = require('../models/userModel');
const CryptoJS = require('crypto-js');

function calculateSHA256(input) {
  const hash = CryptoJS.SHA256(input);
  return hash.toString(CryptoJS.enc.Hex);
}

const getAllUserController = async (req, res) => {
  try {
    const users = await userModel.getAllUser();
    const activeUsers = users.filter(user => user.estado === 'Activo');
    res.json(activeUsers);
  } catch (error) {
    console.error('Error al obtener usuarios:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
};


const createUserController = async (req, res) => {
  const { nombre, tipoUsuario, correoElectronico, contraseña } = req.body;

  try {
    const contraseñaHash = await calculateSHA256(contraseña);
    const nuevoUsuario = await userModel.createUser(nombre, tipoUsuario, correoElectronico, contraseñaHash);
    
    if (nuevoUsuario) { res.status(201).json({ mensaje: 'El usuario se ha creado exitosamente',}); } 
    else {
      res.status(500).json({ error: 'Error interno del servidor', 
      detalle: 'No se pudo crear el usuario'}); }
  } catch (error) {
    console.error('Error al crear un usuario:', error);
    res.status(500).json({ error: 'Error interno del servidor'});
  }
};


const getUserByIdController = async (req, res) => {
  const userId = req.params.id;

  try {
    const usuario = await userModel.getUserById(userId);

    if (usuario) { res.status(200).json(usuario);} 
    else { res.status(404).json({ error: 'Usuario no encontrado' }); }
  } catch (error) {
    console.error('Error al obtener el usuario por ID:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
};

const updateUserController = async (req, res) => {
  const userId = req.params.id;
  const { nombre, tipoUsuario, correoElectronico, contraseña } = req.body;

  try {
    const mensaje = await userModel.updateUser(userId, nombre, tipoUsuario, 
      correoElectronico, contraseña);
    res.status(200).json({ mensaje: 'Usuario Actualizado' });
  } catch (error) {
    if (error.message === 'Usuario no encontrado') {
      res.status(404).json({ error: 'Usuario no encontrado' });
    } else {
      console.error('Error al actualizar el usuario:', error);
      res.status(500).json({ error: 'Error interno del servidor' });
    }
  }
};

const deleteUserController = async (req, res) => {
  const userId = req.params.id;

  try {
    const mensaje = await userModel.deleteUser(userId);
    res.status(200).json({ mensaje: 'Usuario Eliminado' });
  } catch (error) {
    console.error('Error al eliminar el usuario:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
};

module.exports = { getAllUserController, createUserController, getUserByIdController, 
  updateUserController, deleteUserController };