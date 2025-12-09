import hre from "hardhat";

async function main() {
  // Conectar al network manager (Hardhat 3)
  const { ethers } = await hre.network.connect();

  // Obtener cuentas (la 1 para deployer, la 2 para SUNAFIL)
  const [deployer, sunafilAccount] = await ethers.getSigners();

  console.log("Cuenta deployer:", await deployer.getAddress());
  console.log("Cuenta SUNAFIL:", await sunafilAccount.getAddress());

  // Obtener la factory del contrato
  const RegistroLaboralInmutable = await ethers.getContractFactory(
    "Registro_Laboral_Inmutable"
  );

  // Desplegar el contrato pasando la dirección de SUNAFIL al constructor
  const contrato = await RegistroLaboralInmutable.deploy(
    await sunafilAccount.getAddress()
  );

  // Esperar a que termine de desplegar
  await contrato.waitForDeployment();

  const address = await contrato.getAddress();
  console.log("Contrato Registro_Laboral_Inmutable desplegado en:", address);
  console.log("SUNAFIL (validador):", await sunafilAccount.getAddress());
}

// Manejo de errores
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
