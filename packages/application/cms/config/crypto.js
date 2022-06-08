const crypto = require("crypto")

const generateKey = () => {
    return crypto.randomBytes(16).toString('base64');
}

const getEnvFileSample = () => {
    const values = [generateKey(), generateKey()];
    console.warn(`
        - Please add these values to your .env file:

        APP_KEYS=${values.join(',')}
        ADMIN_JWT_SECRET=${generateKey()}
        API_TOKEN_SALT=${generateKey()}
    `);
}

module.exports = {
    generateKey,
    getEnvFileSample
}