// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Registro_Laboral_Inmutable {

    struct EventoLaboralCritico {
        address empleado;
        string tipoEvento;      // "HORA_EXTRA", "DESCANSO_MEDICO", "CONTRATO_OCASIONAL"
        uint256 timestamp;      // Momento en que se registró on-chain
        uint16 duracion;        // HORA_EXTRA = horas, DESCANSO_MEDICO = dias, CONTRATO_OCASIONAL = meses (según front)
        bool esValidado;
        address validador;      // Dirección de SUNAFIL cuando valida
    }

    EventoLaboralCritico[] public eventos;
    address public sunafil;     // Cuenta que representa a SUNAFIL

    event EventoRegistrado(uint256 indexed id, address indexed empleado);
    event EventoCertificado(uint256 indexed id, address indexed validador);

    constructor(address _sunafil) {
        sunafil = _sunafil;
    }

    /// @notice Registra un Evento Laboral Crítico
    /// @param _tipoEvento  Tipo de evento ("HORA_EXTRA", "DESCANSO_MEDICO", "CONTRATO_OCASIONAL", etc.)
    /// @param _duracion    Magnitud del evento:
    ///                     - HORA_EXTRA: horas
    ///                     - DESCANSO_MEDICO: dias
    ///                     - CONTRATO_OCASIONAL: meses (o dias, segun la DApp)
    function registrarEventoLaboral(
        string memory _tipoEvento,
        uint16 _duracion
    ) external {
        eventos.push(
            EventoLaboralCritico({
                empleado: msg.sender,
                tipoEvento: _tipoEvento,
                timestamp: block.timestamp,
                duracion: _duracion,
                esValidado: false,
                validador: address(0)
            })
        );

        emit EventoRegistrado(eventos.length - 1, msg.sender);
    }

    function certificarEvento(uint256 _eventoId) external {
        require(msg.sender == sunafil, "Solo SUNAFIL puede certificar");
        require(_eventoId < eventos.length, "Evento invalido");
        require(!eventos[_eventoId].esValidado, "Ya validado");

        eventos[_eventoId].esValidado = true;
        eventos[_eventoId].validador = msg.sender;

        emit EventoCertificado(_eventoId, msg.sender);
    }

    function obtenerCantidadEventos() external view returns (uint256) {
        return eventos.length;
    }

    function obtenerEvento(uint256 _eventoId)
        external
        view
        returns (
            address empleado,
            string memory tipoEvento,
            uint256 timestamp,
            uint16 duracion,
            bool esValidado,
            address validador
        )
    {
        EventoLaboralCritico memory e = eventos[_eventoId];
        return (
            e.empleado,
            e.tipoEvento,
            e.timestamp,
            e.duracion,
            e.esValidado,
            e.validador
        );
    }
}