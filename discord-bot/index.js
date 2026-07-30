
const { Client, GatewayIntentBits } = require('discord.js');
const express = require('express');
const app = express();
const HTTP_PORT = process.env.PORT || 8081;
app.use(express.json());
app.listen(HTTP_PORT, '0.0.0.0', () => {
    console.log(`Listening on port ${HTTP_PORT}`);
});

app.get('/samp-broadcast', async (req, res) => {
    const { message } = req.query;

    if (!message) {
        return res.status(400).send('Brak parametru "kanal" lub "tekst"');
    }

    try {
        const channel = await client.channels.fetch('1532426496776601834'); // Zamień na ID kanału, na którym chcesz wysyłać wiadomości
        if (!channel) {
            return res.status(404).send('Nie znaleziono kanału');
        }

        await channel.send(message);
        res.status(200).send('Wiadomość została wysłana na Discorda');
    } catch (error) {
        console.error('Błąd podczas wysyłania wiadomości:', error);
        res.status(500).send('Wystąpił błąd podczas wysyłania wiadomości');
    }
});

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