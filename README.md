\# 🧰 Wipro System Maintenance Project



This project is a \*\*System Maintenance Automation Tool\*\* developed for the \*\*Wipro Training \& Placement Assessment\*\*.  

It automates routine system management tasks such as package updates, disk cleanup, log management, backups, and system health checks — all executed using Bash scripts inside a Docker container.



---



\## 🚀 Features



\- ⚙️ Automates multiple system maintenance operations  

\- 📦 Lightweight and portable Docker setup  

\- 🧾 Generates detailed logs for every operation  

\- 🔁 Configurable using `config/` files  

\- 🧹 Cleans unnecessary files and optimizes disk space  



---



\## 🛠️ Technologies Used



| Component | Technology |

|------------|-------------|

| \*\*Scripting Language\*\* | Bash |

| \*\*Automation Platform\*\* | Docker |

| \*\*Version Control\*\* | Git \& GitHub |

| \*\*Operating System\*\* | Linux / Windows (via Git Bash) |



---





---



\## 🐳 How to Run the Project (Using Docker).



This project is containerized using \*\*Docker\*\* to ensure platform independence and easy execution.



\### 1️⃣ Build the Docker Image

Navigate to your project directory and run:

Gitbash and type:-

docker build -t sys-maint:latest .





\## 🐳 How to Run the Docker Container.



docker run --rm -it \\

&nbsp; -v "//c/Users/SURJEET:/host:ro" \\

&nbsp; -v "//c/Users/SURJEET/Downloads/wipro project maintenance system/sys-maintenance/logs:/suite/logs" \\

&nbsp; --name sys-maint \\

&nbsp; sys-maint:latest









