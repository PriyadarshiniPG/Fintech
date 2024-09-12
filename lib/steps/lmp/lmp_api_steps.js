const { LmpApi } = inject();

/* eslint-disable-next-line no-undef */
Given(/^an LMP API flow for the "([\w\s]+)" endpoint$/, async (endpoint) => {
  await LmpApi.setFlow(endpoint);
});

/* eslint-disable-next-line no-undef */
When(/^the LMP API flow is executed$/, async () => {
  await LmpApi.executeFlow();
});

/* eslint-disable-next-line no-undef */
Then(/^the LMP API response is validated$/, async () => {
  await LmpApi.validateResponse();
});
