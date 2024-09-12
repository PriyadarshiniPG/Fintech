const _ = require('lodash');
const event = require('codeceptjs').event;

const { context } = require('../utils/context.js');

module.exports = () => {
  event.dispatcher.on(event.suite.before, (suite) => {
    context.feature.description = suite.comment;
    context.feature.tags = suite.tags;
    // Cut the automatically appended tags from the end of the title
    context.feature.title = _.replace(suite.title, /( @\w+)+/g, '');
  });
  event.dispatcher.on(event.test.before, (test) => {
    context.scenario.tags = test.tags;
    // Cut the automatically appended tags from the end of the title
    context.scenario.title = _.replace(test.title, /( @\w+)+/g, '');
  });
};
