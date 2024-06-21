const { userModel } = require("../models/user.model");
const nodemailer = require('nodemailer');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const fs = require('fs');
const path = require('path');
require('dotenv').config()
const SYSTEMAUTHEMAIL = process.env.SYSTEMAUTHEMAIL;
const SYSTEMAUTHPASSWORD = process.env.SYSTEMAUTHPASSWORD;

module.exports.signUp = async (request, response) => {
    try {
        const { username, email, password } = request.body;
        
        const existingUser = await userModel.findOne({ email });

        if (existingUser) {
            response.json({ message: "Account already exists" });
        } else {
            const hashedPassword = await bcrypt.hash(password, 5);
            await userModel.create({ username, email, password: hashedPassword });
            response.json({ message: "Registration successful" });
        }
    } catch (error) {
        response.status(500).json({ message: "Internal Server Error" });
    }
};

module.exports.signIn = async (request,response) =>{
    try {
        const { email, password } = request.body;
        
        const user = await userModel.findOne({ email });

        if (user) {
            const passwordMatch = await bcrypt.compare(password, user.password);

            if (passwordMatch) {
                let token = jwt.sign({
                    _id: user._id,
                },
                process.env.TOKENSECRITKEY,
                );
                response.json({ message: "Login successful", token , user});
            } else {
                response.status(401).json({ message: "Wrong password" });
            }
        } else {
            response.status(401).json({ message: "Email not found" });
        }
    } catch (error) {
        response.status(500).json({ message: "Internal Server Error" });
    }
};

module.exports.sendConfirmationCode = async (request, response) => {
    try {
        const { email } = request.body;
        const user = await userModel.findOne({email});
        if (!user) {
            return response.status(404).json({ message: "User not found" });
        }
        // Generate a confirmation code
        const confirmationCode = Math.random().toString().slice(2, 6);
        // Save the confirmation code in the user document (you may want to store it securely)
        user.confirmationCode = confirmationCode;
        await user.save();
        // Send the confirmation code to the user's email
        const transporter = nodemailer.createTransport({
            // Configure your email service here
            // Example for sending through Gmail:
            service: 'gmail',
            auth: {
                user: SYSTEMAUTHEMAIL,
                pass: SYSTEMAUTHPASSWORD,
            },
            tls: {
                rejectUnauthorized: false,
            },
        });
        const mailOptions = {
            from: SYSTEMAUTHEMAIL,
            to: user.email,
            subject: 'Tour in Egypt Confirmation Code',
            // text: `Your confirmation code is: ${confirmationCode}`,
            html:`Your confirmation code is: ${confirmationCode}`
        };
        try {
            await transporter.sendMail(mailOptions);
            response.json({ message: "Confirmation code sent successfully" });
        } catch (error) {
            console.error('Error sending confirmation email:', error);
            throw error;
        }
    } catch (error) {
        console.error(error);
        response.status(500).json({ message: "Internal Server Error" });
    }
};

module.exports.verifyConfirmationCode = async (request, response) => {
    try {
        const { email, confirmationCode } = request.body;
        const user = await userModel.findOne({ email });
        if (!user) {
            return response.status(404).json({ message: "User not found" });
        }
        if (user.confirmationCode === confirmationCode) {
            // Clear the confirmation code after successful verification
            user.confirmationCode = undefined;
            await user.save();
            response.json({ message: "Confirmation code is valid" });
        } else {
            response.status(401).json({ message: "Invalid confirmation code" });
        }
    } catch (error) {
        console.error(error);
        response.status(500).json({ message: "Internal Server Error" });
    }
};

module.exports.updateUsername = async (request, response) => {
    try {
        const { newUsername } = request.body;
        const user = await userModel.findOne({ _id: request._id });
        if (!user) {
            return response.status(404).json({ message: "User not found" });
        }
        // Update the user's username
        user.username = newUsername;
        await user.save();
        response.json({ message: "Username updated successfully" });
    } catch (error) {
        console.error(error);
        response.status(500).json({ message: "Internal Server Error" });
    }
};

module.exports.updateEmail = async (request, response) => {
    try {
        const { newEmail } = request.body;
        const user = await userModel.findOne({ _id: request._id });
        if (!user) {
            return response.status(404).json({ message: "User not found" });
        }
        // Check if the new email is already in use by another user
        const existingUserWithNewEmail = await userModel.findOne({ email: newEmail });
        if (existingUserWithNewEmail) {
            return response.status(400).json({ message: "Email already in use" });
        }
        // Update the user's email
        user.email = newEmail;
        await user.save();
        response.json({ message: "Email updated successfully" });
    } catch (error) {
        console.error(error);
        response.status(500).json({ message: "Internal Server Error" });
    }
};

module.exports.updatePassword = async (request, response) => {
    try {
        const { email, newPassword } = request.body;
        const user = await userModel.findOne({ email });
        if (!user) {
            return response.status(404).json({ message: "User not found" });
        }
        // Hash the new password
        const hashedPassword = await bcrypt.hash(newPassword, 5);
        // Update the user's password
        user.password = hashedPassword;
        await user.save();
        response.json({ message: "Password updated successfully" });
    } catch (error) {
        console.error(error);
        response.status(500).json({ message: "Internal Server Error" });
    }
};

module.exports.updatePicture = async (request, response) => {
    try {
        const user = await userModel.findOne({ _id: request._id });
        if (!user) {
            return response.status(404).json({ message: "User not found" });
        }
        // Delete existing picture if present
        if (user.picture) {
            await deleteOldPicture(user.picture);
        }
        // Update user's picture
        await userModel.updateOne({ _id: request._id }, { $set: { picture: request.file.filename } });
        response.json({ message: "Picture updated successfully" });
    } catch (error) {
        console.error(error);
        response.status(500).json({ message: "Internal Server Error" });
    }
};

async function deleteOldPicture(fileName) {
    const oldPicturePath = path.join('uploads', fileName);
    try {
        if (fs.existsSync(oldPicturePath)) {
            fs.unlinkSync(oldPicturePath);
        }
    } catch (error) {
        console.error('Error deleting old picture:', error);
    }
}

module.exports.getAllUsers = async (request, response) => {
    try {
        // Find all users in the database, excluding password, admin, and confirmationCode
        const users = await userModel.find({}, { password: 0, admin: 0, confirmationCode: 0 });
        response.status(200).json({ message: 'Successfully fetched all users', users });
    } catch (error) {
        console.error(error);
        response.status(500).json({ message: 'Internal Server Error' });
    }
}