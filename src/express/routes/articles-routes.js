'use strict';

const {Router} = require(`express`);
const multer = require(`multer`);
const path = require(`path`);
const {nanoid} = require(`nanoid`);
const {PROJECT_DIR, UPLOAD_DIR} = require(`../../../settings`);
const {formatDate, getTime} = require(`../../utils`).dateUtils;
const {renderQueryString} = require(`../../utils`).queryUtils;

const IMAGES_DIR = `img`;

const uploadDirAbsolute = path.resolve(PROJECT_DIR, UPLOAD_DIR, IMAGES_DIR);

const storage = multer.diskStorage({
  destination: uploadDirAbsolute,
  filename: (req, file, cb) => {
    const uniqeName = nanoid(10);
    const extension = file.originalname.split(`.`).pop();
    cb(null, `${uniqeName}.${extension}`);
  }
});

const upload = multer({storage});

const articlesRouter = new Router();
const api = require(`../api`).getAPI();

const {getLogger} = require(`../../service/lib/logger`);
const logger = getLogger({name: `ARTICLES-ROUTER`});

articlesRouter.get(`/category/:id`, (req, res) => res.render(`articles/all-categories`));


articlesRouter.get(`/edit/:id`, async (req, res, next) => {
  try {
    const {id} = req.params;
    const [apiArticleData, apiCategoriesData] = await Promise.all([
      api.getArticle(id),
      api.getCategories()
    ]);
    res.render(`articles/edit`, {apiArticleData, apiCategoriesData});
  } catch (error) {
    logger.error(error);
    next(error);
  }
});

articlesRouter.get(`/add`, async (req, res) => {
  const apiCategoriesData = await api.getCategories();
  const currentDate = formatDate(new Date()).split(` `)[0];
  res.render(`articles/new-post`, {
    apiCategoriesData,
    currentDate,
    prevArticleData: Object.keys(req.query).length === 0 ? null : req.query,
  });
});

articlesRouter.post(`/add`, upload.single(`picture`), async (req, res) => {
  const {body, file} = req;
  const currentTime = getTime(new Date());
  const articleData = {
    title: body.title,
    announce: body.announce,
    fullText: body.fullText,
    createDate: `${body.createDate}, ${currentTime}`,
    category: body.category || [],
  };

  if (file) {
    articleData.picture = file.filename;
  }

  if (typeof articleData.category === `string`) {
    articleData.category = [articleData.category];
  }

  try {
    await api.createArticle(articleData);
    res.redirect(`/my`);
  } catch (error) {
    logger.error(`Ошибка добавления поста: ${error.message}`);
    res.redirect(
        `/articles/add${renderQueryString({
          ...articleData,
          createDate: body.createDate,
        })}`
    );
  }
});

articlesRouter.get(`/:id`, (req, res) => res.render(`articles/post`));


module.exports = {
  articlesRouter,
};
