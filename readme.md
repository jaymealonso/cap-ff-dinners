# FriendFinder Dinners — Sample CAP Project

## Summary

> This is a sample project created to practice and improve my skills with SAP CAP.

**FriendFinder Dinners** is an application designed to connect people over dinner. The goal is to bring together small groups of strangers to encourage meaningful conversations, build connections, and potentially form new friendships.

## Concept

The application works as follows:

1. Users join the app looking to have dinner with new people.
2. During registration, users answer **15 questions** on various topics, rating each from **1 (strongly disagree)** to **10 (strongly agree)**.
3. At a scheduled time, an administrator runs a matching algorithm that forms **groups of six people** based on similar responses and interests.

---

## Technical Notes

### Folder Structure

| File or Folder | Purpose                           |
| -------------- | --------------------------------- |
| `app/`         | UI frontend content               |
| `db/`          | Domain models and data            |
| `srv/`         | Service models and business logic |
| `readme.md`    | Project documentation             |

---

## How to Run

1. Open a new terminal
2. Run:

```bash
cds watch
```

Or, in VS Code:

**Terminal → Run Task → cds watch**

Then start building your domain model in a CDS file inside the `db/` folder.

---

## CAP Reference

Learn more about SAP CAP:
[https://cap.cloud.sap](https://cap.cloud.sap)

