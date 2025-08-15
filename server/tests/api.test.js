const request = require("supertest");
const app = require("../server");

describe("API endpoints", () => {
  test("GET /btc should return bitcoin prices", async () => {
    const response = await request(app).get("/btc");
    expect(response.statusCode).toBe(200);
    expect(response.body).toHaveProperty("price");
  });
});
