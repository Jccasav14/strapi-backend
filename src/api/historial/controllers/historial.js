const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::historial.historial', ({ strapi }) => ({
  async create(ctx) {
    try {
      const { personaje, descripcion, users_permissions_user } = ctx.request.body.data;

      // Verificar usuario autenticado
      const user = ctx.state.user;
      if (!user) {
        return ctx.unauthorized('No autenticado');
      }

      // Crear el registro en la base
      const newHistorial = await strapi.db.query('api::historial.historial').create({
        data: {
          personaje,
          descripcion,
          users_permissions_user: users_permissions_user || user.id, // si no viene, usa el actual
        },
      });

      return newHistorial;
    } catch (error) {
      console.error('Error creando historial:', error);
      ctx.throw(500, 'Error al crear el historial');
    }
  },
}));
