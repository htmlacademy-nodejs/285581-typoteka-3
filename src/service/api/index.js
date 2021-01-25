'use strict';

const {Router} = require(`express`);
const {articleRouter} = require(`../api/article/article`);
const {categoryRouter} = require(`../api/category/category`);
const {searchRouter} = require(`../api/search/search`);

const {getMockData} = require(`../lib/get-mock-data`);

const {
  ArticleService,
  CategoryService,
  CommentService,
  SearchService,
} = require(`../data-service`);

const {sequelize} = require(`../lib/sequelize`);
const defineModels = require(`../models`);

const app = new Router();
defineModels(sequelize);

(async () => {
  const mockData = await getMockData();

  articleRouter(app, new ArticleService(sequelize), new CommentService());
  categoryRouter(app, new CategoryService(sequelize));
  searchRouter(app, new SearchService(sequelize));
})();

module.exports = {
  app
};
