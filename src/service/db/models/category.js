'use strict';
const {Model} = require(`sequelize`);


module.exports = (sequelize, DataTypes) => {

  class Category extends Model {

    static associate(models) {
      // define association here
    }
  }

  Category.init({
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
  }, {
    sequelize,
    modelName: `Category`,
    tableName: `categories`,
    timestamps: false,
    paranoid: false,
  });

  return Category;
};
