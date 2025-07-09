# Freshdesk First Response Automation

## Overview

Managing dozens of support tickets every day? Trying to stay within your SLA limits for first response times? ⏰

This automation script takes care of that for you.

**freshdesk_kpi_monitor.wdl** is a Power Automate Desktop bot that scans all tickets assigned to you in Freshdesk and checks whether they're still within the "First Response Due" window. If they are, it lets you know—so you can reply in time and keep your KPI on track.

No spreadsheets. No manual tracking. Just a simple workflow that makes sure you never miss your SLA target again.

---

## What It Does

- 🚀 Automatically opens your Freshdesk dashboard  
- 🔍 Collects all currently assigned ticket IDs  
- 📅 Extracts the **First Response Due** date/time for each ticket  
- ⏳ Compares that deadline with the current time  
- 🔔 Notifies you if any ticket is still eligible for on-time response  

Whether you’re managing 10 tickets or 50, this tool helps you focus your attention where it counts.

---

## Who It's For

- 👩‍💻 Support agents who want to stay ahead of SLA targets  
- 📈 Team leads monitoring KPI compliance  
- 🤖 Anyone interested in building smart, helpful workflow automation  

You don’t need to be a developer to run this. If you can open Power Automate Desktop, you’re good to go.

---

## How to Use It

1. Open `freshdesk_kpi_monitor.wdl` in Power Automate Desktop.  
2. Make sure your Freshdesk account and ticket view are accessible.  
3. Run the script.  
4. If any tickets are within SLA response time, you’ll get a pop-up with the ticket ID and direct link.

---

## Requirements

- 💻 Windows OS  
- ⚙️ Power Automate Desktop  
- 🔐 Access to Freshdesk with assigned tickets  
- 🛠 Basic understanding of your ticket layout (for any tweaks in selectors)

---

## File Structure

```plaintext
freshdesk-first-response-automation/
├── freshdesk_kpi_monitor.wdl    # Main automation script  
├── LICENSE                      # Open source under MIT  
└── README.md                    # Project documentation
```
## 🚧 Roadmap

Planned future improvements:

- ✍️ Auto-fill draft replies in Freshdesk (so you’re always ready to send)  
- 📲 Notification alerts via Teams or Slack  
- 📩 Daily email summary of upcoming SLA deadlines  

---

## 📄 License

This project is licensed under the [MIT License](LICENSE). You’re free to use, modify, and distribute it with credit.

---

This project is designed to make support work less stressful, more efficient, and more responsive—without adding complexity.  
If you're in support, ops, or just love automation, this one's for you.
