
const { Client, GatewayIntentBits } = require('discord.js');

require('dotenv').config();

const client = new Client({
    intents: [
        GatewayIntentBits.Guilds,           // Wymagane do podstawowego działania w serwerach
        GatewayIntentBits.GuildMessages,    // Wymagane do odbierania wiadomości tekstowych
        GatewayIntentBits.MessageContent    // Wymagane do czytania treści wiadomości
    ]
});

client.once('clientReady', () => {
    console.log(`Zalogowano jako ${client.user.tag}! Bot jest gotowy do pracy.`);
});

client.on('messageCreate', async (message) => {
    if (message.author.bot) return;

    if (message.content.toLowerCase() === 'ping') {
        try {
            await message.reply('Pong! 🏓');
        } catch (error) {
            console.error('Błąd podczas wysyłania wiadomości:', error);
        }
    }
});

client.login(process.env.DISCORD_TOKEN);