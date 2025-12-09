# **ValidChain – DApp de Registro Laboral Inmutable**

ValidChain es una aplicación descentralizada (**DApp**) diseñada para registrar, supervisar y certificar **Eventos Laborales Críticos (ELC)** en una blockchain privada.  
El sistema garantiza **inmutabilidad**, **transparencia** y **verificabilidad**, evitando alteraciones de información por parte de empresas o terceros.

---

##**Descripción del Sistema**

La aplicación permite registrar tres tipos principales de eventos laborales:

- **Horas Extra**, se registra la duración en horas.  
- **Descanso Médico**, duración en días, semanas o meses.  
- **Contrato Ocasional**, duración en meses.

Cada registro queda grabado on-chain mediante un contrato inteligente implementado en Solidity.

---

## 👥 **Roles del Sistema**

### **Empleado**
- Registra sus eventos laborales.
- Visualiza todos sus eventos registrados en blockchain.

### **Departamento de RR.HH.**
- Supervisa los eventos enviados por los empleados.
- Revisa el estado general (pendientes y validados).

### **SUNAFIL**
- Certifica los eventos laborales registrados.
- Es la única cuenta autorizada para validar información dentro del contrato.

---

## 🛠️ **Tecnologías Utilizadas**

- **Frontend:** React, HTML, CSS  
- **Integración Blockchain:** Ethers.js + MetaMask  
- **Contratos Inteligentes:** Solidity  
- **Framework de desarrollo:** Hardhat  
- **Blockchain local:** Ganache  

---

## 📌 **Características Principales**

- Registro inmutable de eventos laborales.  
- Validación oficial por la entidad SUNAFIL.  
- Roles estrictos según la wallet conectada.  
- Interfaz intuitiva para empleados, RR.HH. y SUNAFIL.  
- Compatible con MetaMask y redes Ethereum locales.
