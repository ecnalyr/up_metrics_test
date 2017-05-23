import { UpMetricsTestPage } from './app.po';

describe('up-metrics-test App', () => {
  let page: UpMetricsTestPage;

  beforeEach(() => {
    page = new UpMetricsTestPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
